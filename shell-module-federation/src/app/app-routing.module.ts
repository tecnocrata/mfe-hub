import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';

const routes: Routes = [
  {
    path: 'home',
    // redirectTo: 'home',
    component: HomeComponent,
    pathMatch: 'full',
  },
  // {
  //   path: 'mymfe',
  //   // redirectTo: 'home',
  //   loadChildren: () =>
  //     import('angular11ModuleFederation/FModule').then((m) => m.FlightsModule),
  // },
  {
    path: 'flights',
    loadChildren: () => import('mfe1/Module').then((m) => m.FlightsModule),
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
