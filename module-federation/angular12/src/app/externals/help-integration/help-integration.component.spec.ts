import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HelpIntegrationComponent } from './help-integration.component';

describe('HelpIntegrationComponent', () => {
  let component: HelpIntegrationComponent;
  let fixture: ComponentFixture<HelpIntegrationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HelpIntegrationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HelpIntegrationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
