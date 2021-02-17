import { chain, externalSchematic, Rule, SchematicContext, Tree } from '@angular-devkit/schematics';
import { NodePackageInstallTask } from '@angular-devkit/schematics/tasks';
import {
  addImportToModule,
  addModuleImportToRootModule,
  addPackageJsonDependency,
  getAppModulePath,
  getProjectFromWorkspace,
  getSourceFile,
  getWorkspace,
  InsertChange,
  NodeDependency,
  NodeDependencyType,
  ProjectType,
  WorkspaceProject
} from 'schematics-utilities';
import { getProjectTargetOptions, ts } from 'schematics-utilities/dist/cdk';
import { OptionsGenerate } from './options';
import { SchematicOptions } from './schema';

function generateAngular(schema: SchematicOptions, target: string, options: OptionsGenerate): Rule {
  return externalSchematic('@schematics/angular', target, options);
}

function generateNrwlAngular(schema: SchematicOptions, target: string, options: OptionsGenerate): Rule {
  return externalSchematic('@nrwl/angular', target, options);
}

function generateModule(schema: SchematicOptions, options: OptionsGenerate): Rule {
  return generateAngular(schema, 'module', options);
}

function generateService(schema: SchematicOptions, options: OptionsGenerate): Rule {
  return generateAngular(schema, 'service', options);
}

function generateComponent(schema: SchematicOptions, options: OptionsGenerate): Rule {
  return generateAngular(schema, 'component', options);
}

function generateLib(schema: SchematicOptions, options: OptionsGenerate): Rule {
  return generateNrwlAngular(schema, 'lib', options);
}
/**************************************************** nrwl ****************************************************/ 
// Generar Aplicación NX (projectName)
function generateAppNg(schema: SchematicOptions): Rule {
  return externalSchematic('@nrwl/angular', 'app', {
    name: schema.name,
    prefix: schema.prefix,
    style: 'scss',
    routing: false,
    strict: true
  });
}

// Generamos libreria Ui
function generateLibraryUi(schema: SchematicOptions): Rule {
  return generateLib(schema, {
    name: schema.uiLib,
    directory: schema.utils ? `utils/${schema.name}` : 'utils',
    buildable: true,
    enableIvy: true,
    publishable: true,
    importPath: `@angularbuilders/${schema.uiLib}`,
    prefix: `${schema.prefix}-${schema.uiLib}`,
    simpleModuleName: true
  });
}

// Generamos libreria data
function generateLibraryData(schema: SchematicOptions): Rule {
  return generateLib(schema, {
    name: schema.dataLib,
    directory: schema.utils ? `utils/${schema.name}` : 'utils',
    buildable: true,
    enableIvy: true,
    publishable: true,
    importPath: `@angularbuilders/${schema.dataLib}`,
    simpleModuleName: true,
    strict: true
  });
}

// generamos libreria model
function generateLibraryModel(schema: SchematicOptions): Rule {
  return externalSchematic('@nrwl/workspace', 'lib', {
    name: schema.modelLib,
    directory: schema.utils ? `utils/${schema.name}` : 'utils',
    strict: true,
    importPath: `@angularbuilders/${schema.modelLib}`,
    testEnvironment: 'node'
  });
}

function generateLibraryAuth(schema: SchematicOptions): Rule {
  return generateLib(schema, {
    name: schema.authLib,
    directory: schema.utils ? `utils/${schema.name}` : 'utils',
    buildable: true,
    enableIvy: true,
    publishable: true,
    importPath: `@angularbuilders/${schema.authLib}`,
    prefix: `${schema.prefix}-${schema.authLib}`,
    simpleModuleName: true
  });
}
/**************************************************** schematics ****************************************************/ 
// Generar módulo Core
function generateModuleCore(schema: SchematicOptions): Rule {
  return generateModule(schema, {
      project : schema.name,
      name:  'core',
      routing: true,
      module: 'app',
      routingScope: 'Root'
    });
  }

// Generar módulo Shared
function generateModuleShared(schema: SchematicOptions): Rule {
  return generateModule(schema, {
      project: schema.name,
      name:  'shared',
    });
  }

// Generar componente Shell dentro de Core
function generateComponentShellCore(schema: SchematicOptions): Rule {
  return generateComponent(schema, {
    project : schema.name,
    module: 'core',
    name: 'core/shell',
    export: true,
    skipImport: true,
    skipTests: true
  });
}

// Genera servicio llamado API dentro de Core
function generateServiceApiCore(schema: SchematicOptions): Rule {
  return generateService(schema, {
    project: schema.name,
    module: 'core',
    name: 'core/api',
    flat: false,
    export: true,
    skipTests: true
  });
}

// Generar componente llamado Card dentro de Shared
function generateComponentCardShared(schema: SchematicOptions): Rule {
  return generateComponent(schema, {
    project : schema.name,
    name: 'shared/card',
    module: 'shared',
    export: true,
    skipImport: true,
    skipTests: true
  });
}

// Generar pipe en Shared
function generatePipeShared(schema: SchematicOptions): Rule {
  return externalSchematic('@schematics/angular', 'pipe', {
    project : schema.name,
    name: 'shared/timeAgo',
    module: 'shared',
    export: true,
    'skip-tests': true
  });
}

// generar directiva en Shared
function generateDirectiveShared(schema: SchematicOptions): Rule {
  return externalSchematic('@schematics/angular', 'directive', {
    project : schema.name,
    name: 'shared/track',
    module: 'shared',
    export: true,
    'skip-import': true,
    'skip-tests': true
  });
}

// Generar interceptor llamado Auth dentro de core/api 
function generateInterceptorAuth(schema: SchematicOptions): Rule {
  return externalSchematic('@schematics/angular', 'interceptor', {
    project: schema.name,
    name:  'core/api/auth',
    'skip-tests': true
  });
}

// Generar resolver en Core
function generateResolversCore(schema: SchematicOptions): Rule {
  return externalSchematic('@schematics/angular', 'resolver', {
    project: schema.name,
    name: 'core/api/data',
    import: true,
    'skip-tests': true
  });
}

// Generar guard en Core
function generateGuardCore(schema: SchematicOptions): Rule {
  return externalSchematic('@schematics/angular', 'guard', {
    project: schema.name,
    name:  'core/guards',
    implements: ['CanActivate'], // si no lo tiene pregunta cual implements se quiere
    'skip-tests': true
  });
}

// Generar un módulo enrutado Home con la ruta /
function generateModuleHome(schema: SchematicOptions): Rule {
  return generateModule(schema, {
    project: schema.name,
    name:  'routes/home',
    module: 'core/core.module.ts',
    routing: true,
    route: '/'
  });
}

// Generar un módulo enrutado About con la ruta /about
function generateModuleAbout(schema: SchematicOptions): Rule {
  return generateModule(schema, {
    project: schema.name,
    name:  'routes/about',
    module: 'core/core.module.ts',
    routing: true,
    route: 'about'
  });
}

// Update angular.json
function updateAngularJSON(): Rule {
  return (tree: Tree) => {
    const jsonStr: string = tree.read('angular.json')!.toString('utf-8');
    const json: any = JSON.parse(jsonStr);
  if(!json.schematics){
    json.schematics= {};
  }
  const node2 = '@schematics/angular:component';
  json.schematics[node2] = {
    export: false,
    'change-detection': 'OnPush',
  };
    const newJson = JSON.stringify(json, null, 2);
    tree.overwrite('angular.json', newJson);
    return tree;
  };
}

// Update package.json
function updatePackageJSON(): Rule {
  return (tree: Tree) => {
    const jsonStr: string = tree.read('package.json')!.toString('utf-8');
    const json: any = JSON.parse(jsonStr);
    json.scripts.start = 'ng serve -o';
    const newJson = JSON.stringify(json, null, 2);
    tree.overwrite('package.json', newJson);
    return tree;
  };
}

// Agregar dependencia DEV
function addDependencyPackageJSON(): Rule {
  return (tree: Tree, context: SchematicContext) => {
    const dependencies: NodeDependency[] = [
      { type: NodeDependencyType.Dev, version: '0.16.3', name: 'json-server' },
    ];

    dependencies.forEach(dependency => {
      addPackageJsonDependency(tree, dependency);
      context.logger.log('info', `✅️ Agregada "${dependency.name}" en ${dependency.type}`);
    });
    return tree;
  };
}

// Agregar import de un modulo al app.module 
function addModuleToImports(schema: SchematicOptions): Rule {
  return (tree: Tree, context: SchematicContext) => {
   const workspace = getWorkspace(tree);
    const project = getProjectFromWorkspace(
      workspace,
      schema.name ? schema.name : Object.keys(workspace['project'])[0]
    );
    const moduleName = 'SharedModule';
    addModuleImportToRootModule(tree, moduleName, './shared/shared.module', project as WorkspaceProject<ProjectType.Application>);
    context.logger.log('info', `✅️ "${moduleName}" esta importado`);

    return tree;
  };
}

// Agregar import de un modulo //Función personalizada para insertar un NgModule en las importaciones de NgModule. También importa el módulo
function addImport(schema: SchematicOptions): Rule {
  return (tree: Tree) => {
    // const workspace = getWorkspace(tree);
    // const project = workspace.projects[schema.name || workspace.defaultProject!];
    // const buildOptions = getProjectTargetOptions(project, 'build');
    const modulePath =  './app.module.ts'; // getAppModulePath(tree, buildOptions.main); //'./app.module.ts';
    const moduleSource: any = getSourceFile(tree, '/apps/project34/src/app/app.module.ts');
    console.log(moduleSource);
    const changes = addImportToModule(moduleSource, '/apps/project34/src/app/app.module.ts','SharedModule', './shared/shared.module');
    const recorder = tree.beginUpdate('/apps/project34/src/app/app.module.ts');
    changes.forEach((change) => {
      if (change instanceof InsertChange) {
        recorder.insertLeft(change.pos, change.toAdd);
      }
    });
    tree.commitUpdate(recorder);
    return tree;
  };
}

// Instalar paquetes
function installPackageJsonDependencies(): Rule {
  return (tree: Tree, context: SchematicContext) => {
    context.addTask(new NodePackageInstallTask());
    context.logger.log('info', `🔍 Instalando packages...`);
    return tree;
  };
}

export default function (schema: SchematicOptions): Rule {
  return (tree: Tree, context: SchematicContext) => {
    return chain([generateAppNg(schema), generateLibraryUi(schema), generateLibraryData(schema), generateLibraryModel(schema),
      generateLibraryAuth(schema), generateModuleCore(schema), generateModuleShared(schema), generateModuleHome(schema), 
      generateModuleAbout(schema), generatePipeShared(schema), generateDirectiveShared(schema), 
      generateComponentCardShared(schema), generateComponentShellCore(schema), 
      generateServiceApiCore(schema), generateInterceptorAuth(schema), generateResolversCore(schema), 
      generateGuardCore(schema), updateAngularJSON(), updatePackageJSON(), addDependencyPackageJSON(), 
      addModuleToImports(schema)])(
      tree,
      context
    );
  };
}