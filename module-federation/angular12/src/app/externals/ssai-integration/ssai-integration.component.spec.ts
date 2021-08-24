import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SsaiIntegrationComponent } from './ssai-integration.component';

describe('SsaiIntegrationComponent', () => {
  let component: SsaiIntegrationComponent;
  let fixture: ComponentFixture<SsaiIntegrationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SsaiIntegrationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SsaiIntegrationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
