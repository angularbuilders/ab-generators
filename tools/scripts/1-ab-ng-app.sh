# inside  ORGANIZATION folder
echo "🏠 clean nx apps";
nx g @nrwl/workspace:remove init-e2e
nx g @nrwl/workspace:remove init
echo "🏠 init nx-workspace";
git branch -M main
git remote add origin https://github.com/TrainingITCourses/research.git
git add *
git commit -m 'chore: intial commit'
ng update @angular/cli @angular/core --force
git add *
git commit -m 'chore: ng update'
ng g application www -p rsrch --strict --style css -S --routing false
echo " configure .eslintrc.json rules and start script";
json -I -f .eslintrc.json -e "this.overrides[0].rules['@angular-eslint/component-class-suffix'] = ['error',{'suffixes': ['Component','Form','Page','Template','Widget']}];"
json -I -f .eslintrc.json -e "this.overrides[1].rules['@typescript-eslint/no-empty-function'] = ['off'];"
echo "this.scripts.dev = 'ng serve -o --hmr'"
json -I -f package.json -e "this.scripts.dev = 'ng serve -o --hmr';"
git add *
git commit -m 'chore: configure .eslintrc.json rules and start script'
echo " generate core module with routing "
nx g module core --module=app --routing --routingScope=Root --no-interactive
git add *
git commit -m 'feat: generate core module with routing'
echo "🏠 app intitial configuration";
