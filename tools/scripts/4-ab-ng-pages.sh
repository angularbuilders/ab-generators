echo "🚧 page libraries ";
echo " generate home page";
nx g library home --importPath=@rsrch/home --prefix=rsrch --routing --lazy --parentModule='apps\www\src\app\core\core-routing.module.ts' --tags='domain, page'
nx g c home --project=domain-home --flat --skipTests=false --skipSelector --type=Page
nx g c home --project=domain-home
nx g s home --project=domain-home --flat
git add *
git commit -m 'feat: generate home page'
echo " generate search page";
nx g library search --importPath=@rsrch/search --prefix=rsrch --routing --lazy --parentModule='apps\www\src\app\core\core-routing.module.ts' --tags='domain, page'
nx g c search --project=domain-search --flat --skipTests=false --skipSelector --type=Page
nx g c search --project=domain-search
nx g s search --project=domain-search --flat
git add *
git commit -m 'feat: generate search page'
echo " generate not-found page";
nx g library not-found --importPath=@rsrch/not-found --prefix=rsrch --routing --lazy --parentModule='apps\www\src\app\core\core-routing.module.ts' --tags='domain, page'
nx g c not-found --project=domain-not-found --flat --skipSelector --type=Page
git add *
git commit -m 'feat: generate not-found page'
echo "🏠 page libraries";
