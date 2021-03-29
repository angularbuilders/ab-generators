# cd ORGANIZATION
echo "🚧 app strict and core module";
echo "on six"
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
json -I -f package.json -e "this.scripts.dev = 'ng serve -o --hmr';"
echo "this.scripts.dev = 'ng serve -o --hmr'"
nx g module core --module=app --routing --routingScope=Root --no-interactive
git branch -M main
git remote add origin https://github.com/ORGANIZATION/REPOSITORY.git
git add *
git commit -m 'chore: app strict and core module'
echo "🏠 app strict and core module";