# TasteAdvisor

//MODIFICHE STRUTTURA
-import boostrap e ridenominazione application.css
-aggiunta bootstrap-sprockets a application.js
-aggiunta degli stylesheets (css) in app/assets/stylesheets 
-inserito alert e notice in singola pagina e rimosso da application.html.erb
-inserito pin bootstrap per inclusione bootstrap.bundle.js in config/importmap.rb
-import bootstrap in app/javascript/application.js

//NOTE
-nei file html.erb alcuni attributi degli elementi html (id,class,..etc) vengono inseriti da rails -> ispezionare per identificarli
-in recupera password del signin viene generato un link a "reviewers/password/new" 