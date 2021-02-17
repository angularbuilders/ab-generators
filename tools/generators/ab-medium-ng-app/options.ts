export interface OptionsGenerate {
    name: string;

    // application 
    prefix?: any;
    routing?: boolean;
    strict?: boolean;

    // lib
    directory?: string;
    buildable?: boolean;
    enableIvy?: boolean;
    publishable?: boolean;
    importPath?: string;
    simpleModuleName?: boolean;

    // component
    export?: boolean;
    skipImport?: boolean;

    // service
    flat?: boolean;
    project?: string;
    skipTests?: boolean;

    // module
    module?: string;
    routingScope?: string;
    route?: string;

}