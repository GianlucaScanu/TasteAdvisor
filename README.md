# TasteAdvisor

//MODIFICHE STRUTTURA
-import boostrap e ridenominazione application.css
-aggiunta bootstrap-sprockets a application.js
-aggiunta degli stylesheets (css) in app/assets/stylesheets 
-inserito alert e notice in singola pagina e rimosso da application.html.erb
-inserito pin bootstrap per inclusione bootstrap.bundle.js in config/importmap.rb
-import bootstrap in app/javascript/application.js
-modificato application.scss:  *= require_tree . a  * require_tree .    (annullo caricamento pagine css)

//NOTE
-nei file html.erb alcuni attributi degli elementi html (id,class,..etc) vengono inseriti da rails -> ispezionare per identificarli
-in recupera password del signin viene generato un link a "reviewers/password/new" 
FORMATO UTENTI DI TEST: (su questo branch)

    MAIN:   
        email:restaurant@test.com
        password:123456
        
        email:reviewer@test.com
        password:123456
        
    ULTERIORI:
    (N = numero naturale > 0)

    email:testN@test.com
    password:123456

    Fino al 10 non c'e' un criterio. Si può concordare di usare N pari per i recensori e dispari per i ristoranti, da N > 10.

    Possono risultare altri utenti con criteri diversi, evitare di generarli, utilizzarli ecc..
