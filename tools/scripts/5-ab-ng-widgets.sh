echo "🚧 widget libraries ";
echo " generate search-box widget";
nx g library search-box --importPath=@ab/search-box --prefix=ab --tags='domain, widget'
nx g c search-box --project=domain-search-box --flat --skipTests=false --type=Widget --export=true
nx g c search-box --project=domain-search-box
nx g s search-box --project=domain-search-box --flat
git add *
git commit -m 'feat: generate search-box widget'
echo "🏠 widget libraries";