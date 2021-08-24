import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  {
    path: 'editors',
    loadChildren: () =>
      import('./editors/editors.module').then((m) => m.EditorsModule),
  },
  {
    path: 'externals',
    loadChildren: () =>
      import('./externals/externals.module').then((m) => m.ExternalsModule),
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
