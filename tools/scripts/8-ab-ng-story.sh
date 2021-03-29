echo "🚧 add storybook";
echo "storybook"
nx g @nrwl/storybook:configuration
ng g @nrwl/storybook:configuration --name=shared-ui --uiFramework=@storybook/angular
echo "🏠 add storybook";