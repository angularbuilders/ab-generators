echo "🚧 page libraries ";
echo " generate home page";
nx g library home --importPath=@ab/home --prefix=ab --routing --lazy --parentModule='apps\www\src\app\core\core-routing.module.ts' --tags='domain, page'
nx g c home --project=domain-home --flat --skipTests=false --skipSelector --type=Page
nx g c home --project=domain-home
nx g s home --project=domain-home --flat
git add *
git commit -m 'feat: generate home page'
echo " generate search page";
nx g library search --importPath=@ab/search --prefix=ab --routing --lazy --parentModule='apps\www\src\app\core\core-routing.module.ts' --tags='domain, page'
nx g c search --project=domain-search --flat --skipTests=false --skipSelector --type=Page
nx g c search --project=domain-search
nx g s search --project=domain-search --flat
git add *
git commit -m 'feat: generate search page'
echo " generate not-found page";
nx g library not-found --importPath=@ab/not-found --prefix=ab --routing --lazy --parentModule='apps\www\src\app\core\core-routing.module.ts' --tags='domain, page'
nx g c not-found --project=domain-not-found --flat --skipSelector --type=Page
git add *
git commit -m 'feat: generate not-found page'
echo "🏠 page libraries";