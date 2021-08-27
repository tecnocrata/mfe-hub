import { loadRemoteModule } from '@angular-architects/module-federation';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnalyticsComponent } from './analytics.component';
import { VueComponentComponent } from './vue-component/vue-component.component';

const routes: Routes = [
  { path: '', component: AnalyticsComponent },
  // {
  //   path: 'app', // This route path anything because the MFE module doesn't contains the componentes within a parent route
  //   loadChildren: () =>
  //     loadRemoteModule({
  //       remoteEntry: 'http://localhost:6002/remoteEntry.js',
  //       remoteName: 'body',
  //       exposedModule: './body',
  //     }).then((m) => m.default), // Why default? it is because is the default module name
  // },
  {
    path: '',
    component: AnalyticsComponent,
    children: [
      {
        path: 'app', // This route path anything because the MFE module doesn't contains the componentes within a parent route
        loadChildren: () =>
          loadRemoteModule({
            remoteEntry: 'http://localhost:6002/remoteEntry.js',
            remoteName: 'body',
            exposedModule: './body',
          }).then((m) => {
            return m.default;
          }), // Why default? it is because is the default module name
      },
      {
        path: 'component', // This route path anything because the MFE module doesn't contains the componentes within a parent route
        component: VueComponentComponent,
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AnalyticsRoutingModule {}
