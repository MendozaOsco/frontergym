import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({ providedIn: 'root' })
export class RecordatoriosService {
  private base = `${environment.apiUrl}/recordatorios`;
  constructor(private http: HttpClient) { }

  enviar(usuarioId: number) {
    return this.http.post<any>(`${this.base}/${usuarioId}`, {});
  }
}
