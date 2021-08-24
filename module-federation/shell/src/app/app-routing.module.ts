import { loadRemoteModule } from '@angular-architects/module-federation';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { WelcomeComponent } from './welcome/welcome.component';

const routes: Routes = [
  {
    path: 'editors', // This route path should be the same than MFE exported and used in the MFE
    loadChildren: () =>
      loadRemoteModule({
        remoteEntry: 'http://localhost:6001/remoteEntry.js',
        remoteName: 'angular12',
        exposedModule: './EditorsModule',
      }).then((m) => m.EditorsModule),
  },
  {
    path: 'integrations', // This route path anything because the MFE module doesn't contains the componentes within a parent route
    loadChildren: () =>
      loadRemoteModule({
        remoteEntry: 'http://localhost:6001/remoteEntry.js',
        remoteName: 'angular12',
        exposedModule: './ExternalsModule',
      }).then((m) => m.ExternalsModule),
  },
  { path: 'welcome', component: WelcomeComponent },
  { path: '', component: WelcomeComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
