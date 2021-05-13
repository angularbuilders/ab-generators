echo "🚧 shared libraries ";
echo " generate global library";
nx g library global --directory=shared --importPath=@rsrch/global --tags='shared, core'
nx g class global.tokens --project=shared-data
ng g interface models/environment --project shared-global
git add *
git commit -m 'feat: generate global library'
echo " generate data library";
nx g library data --directory=shared --importPath=@rsrch/data  --tags='shared, core'
nx g interceptor adapter --project=shared-data
nx g interceptor tracker --project=shared-data
nx g class store --project=shared-data
git add *
git commit -m 'feat: generate data library'
echo " generate ui library";
nx g library ui --directory=shared --importPath=@rsrch/ui --prefix=rsrch-ui  --tags='shared, ui'
nx g c components/breadcrumb  --project=shared-ui --export=true
nx g c components/header  --project=shared-ui --export=true
nx g c components/menu --project=shared-ui --export=true
nx g c components/message --project=shared-ui --export=true
nx g c components/notification --project=shared-ui --export=true
nx g c components/tabs --project=shared-ui --export=true
nx g c templates/box --project=shared-ui --export=true --type=Template
nx g c templates/card --project=shared-ui --export=true --type=Template
nx g c templates/modal --project=shared-ui --export=true --type=Template
nx g c templates/page --project=shared-ui --export=true --type=Template
nx g c templates/panel --project=shared-ui --export=true --type=Template
nx g c templates/section --project=shared-ui --export=true --type=Template
nx g directive directives/track --project=shared-ui --export=true
nx g pipe pipes/truncate --project=shared-ui --export=true
git add *
git commit -m 'feat: generate ui library'
echo " generate form library";
nx g library form --directory=shared --importPath=@rsrch/form --prefix=rsrch-form  --tags='shared, ui'
nx g c components/control --project=shared-form --export=true
nx g class validators --project=shared-form
git add *
git commit -m 'feat: generate ui library'
echo " generate layout library";
nx g library layout --directory=shared --importPath=@rsrch/layout --prefix=rsrch --tags='shared, ui'
nx g c layout --project=shared-layout --flat --export=true
nx g c navbar --project=shared-layout
nx g c footer --project=shared-layout
git add *
git commit -m 'feat: generate layout library'
echo "🏠 shared libraries ";
