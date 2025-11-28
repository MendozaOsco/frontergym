import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({ providedIn: 'root' })
export class DashboardService {
  private base = `${environment.apiUrl}/dashboard`;
  constructor(private http: HttpClient) { }
  resumen(usuarioId: number) { return this.http.get<any>(`${this.base}/${usuarioId}`); }
}
