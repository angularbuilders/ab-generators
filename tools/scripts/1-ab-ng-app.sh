# cd ORGANIZATION
git branch -M main
git remote add origin https://github.com/ORGANIZATION/REPOSITORY.git
git add *
git commit -m 'chore: intial commit'
echo "🚧 app intitial configuration ";
echo " app strict ";
json -I -f apps/web/tsconfig.json -e "this.compilerOptions = { };"
echo "this.compilerOptions = { }"
json -I -f apps/web/tsconfig.json -e "this.compilerOptions.forceConsistentCasingInFileNames = true;"
echo "this.compilerOptions.forceConsistentCasingInFileNames = true"
json -I -f apps/web/tsconfig.json -e "this.compilerOptions.strict = true;"
echo "this.compilerOptions.strict = true"
json -I -f apps/web/tsconfig.json -e "this.compilerOptions.noImplicitReturns = true;"
echo "this.compilerOptions.noImplicitReturns = true"
json -I -f apps/web/tsconfig.json -e "this.compilerOptions.noFallthroughCasesInSwitch = true;"
echo "this.compilerOptions.noFallthroughCasesInSwitch = true"
json -I -f apps/web/tsconfig.json -e "this.angularCompilerOptions = { };"
echo "this.angularCompilerOptions = { }"
json -I -f apps/web/tsconfig.json -e "this.angularCompilerOptions.strictInjectionParameters = true;"
echo "this.angularCompilerOptions.strictInjectionParameters = true"
json -I -f apps/web/tsconfig.json -e "this.angularCompilerOptions.strictTemplates = true;"
echo "this.angularCompilerOptions.strictTemplates = true"
git add *
git commit -m 'chore: app strict '
echo " configure .eslintrc.json rules and start script";
json -I -f .eslintrc.json -e "this.overrides[0].rules['@angular-eslint/component-class-suffix'] = ['error',{'suffixes': ['Component','Form','Page','Template','Widget']}];"
json -I -f .eslintrc.json -e "this.overrides[1].rules['@typescript-eslint/no-empty-function'] = ['off'];"
# ToDo : add this rule to every lib
json -I -f .eslintrc.json -e "this.overrides[1].rules['@angular-eslint/no-empty-lifecycle-method'] = ['off'];"
echo "this.scripts.dev = 'ng serve -o --hmr'"
json -I -f package.json -e "this.scripts.dev = 'ng serve -o --hmr';"
git add *
git commit -m 'chore: configure .eslintrc.json rules and start script'
echo " generate core module with routing "
nx g module core --module=app --routing --routingScope=Root --no-interactive
git add *
git commit -m 'feat: generate core module with routing'
echo "🏠 app intitial configuration";
