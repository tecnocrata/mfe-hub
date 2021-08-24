import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ExternalsComponent } from './externals.component';
import { HelpIntegrationComponent } from './help-integration/help-integration.component';
import { SsaiIntegrationComponent } from './ssai-integration/ssai-integration.component';

const routes: Routes = [
  // { path: '', component: ExternalsComponent },
  { path: 'ssai', component: SsaiIntegrationComponent },
  { path: 'help', component: HelpIntegrationComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ExternalsRoutingModule {}
