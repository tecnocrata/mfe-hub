import { loadRemoteModule } from '@angular-architects/module-federation';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { WelcomeComponent } from './welcome/welcome.component';

const routes: Routes = [
  {
    path: 'angular-12',
    loadChildren: () =>
      loadRemoteModule({
        remoteEntry: 'http://localhost:6001/remoteEntry.js',
        remoteName: 'angular12',
        exposedModule: './EditorsModule',
      }).then((m) => m.EditorsModule),
  },
  { path: 'welcome', component: WelcomeComponent },
  { path: '', component: WelcomeComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
