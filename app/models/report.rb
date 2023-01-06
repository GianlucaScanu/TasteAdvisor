class Report < ApplicationRecord
    
    #https://stackoverflow.com/questions/7428872/rails-validate-unique-combination-of-3-columns
    #UN SOLO REPORT PER COPPIA <REPORTERID,TARGETID, TARGETTYPE>, (reporterId)
    validates_uniqueness_of :reporterId, :scope => [:targetId, :targetType]
    after_create :remove_target

    private

        def remove_target
            #dopo le 50 segnalazioni (da utenti diversi) il sistema rimuove automaticamente il target 

            limit_to_remove = 50.0 
            counter = 0.0
            
            #ottengo il numero delle segnalazioni su quel target
            (Report.all).each do |report|
                if( report.targetId == targetId and report.targetType == targetType )
                    counter += 1.0
                end
            end

            if(counter >= limit_to_remove)

                if(targetType == "dish") #dish
                    target = Dish.find_by_id(targetId)
                else #review
                    target = Review.find_by_id(targetId)
                end

                tId = targetId.to_i
                tType = targetType.to_s

                #rimuovi target
                target.destroy
                #non ha senso mantenere le segnalazioni di un target eliminato, vengono cancellate a catena
                Report.where(targetId: tId).where(targetType: tType).destroy_all
            end

        end

end
