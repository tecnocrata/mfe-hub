import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ExternalsRoutingModule } from './externals-routing.module';
import { ExternalsComponent } from './externals.component';
import { SsaiIntegrationComponent } from './ssai-integration/ssai-integration.component';
import { HelpIntegrationComponent } from './help-integration/help-integration.component';


@NgModule({
  declarations: [
    ExternalsComponent,
    SsaiIntegrationComponent,
    HelpIntegrationComponent
  ],
  imports: [
    CommonModule,
    ExternalsRoutingModule
  ]
})
export class ExternalsModule { }
