import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ExternalsComponent } from './externals.component';

const routes: Routes = [{ path: '', component: ExternalsComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ExternalsRoutingModule { }
