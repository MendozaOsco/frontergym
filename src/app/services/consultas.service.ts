import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { toHttpParams } from './http.util';
import { environment } from '../../environments/environment';

@Injectable({ providedIn: 'root' })
export class ConsultasService {
  private base = `${environment.apiUrl}/consultas`;
  constructor(private http: HttpClient) { }
  crear(dto: { usuarioId: number; asunto: string; mensaje: string; tipo?: string; }) {
    return this.http.post<any>(`${this.base}`, dto);
  }
  crearMe(dto: { asunto: string; mensaje: string; tipo?: string; }) {
    return this.http.post<any>(`${this.base}/me`, dto);
  }
  listar(usuarioId: number) { return this.http.get<any[]>(`${this.base}`, { params: toHttpParams({ usuarioId }) }); }
  listarMe() { return this.http.get<any[]>(`${this.base}/me`); }
  obtener(id: number) { return this.http.get<any>(`${this.base}/${id}`); }
  responder(id: number, respuesta: string) { return this.http.post<any>(`${this.base}/${id}/responder`, { respuesta }); }
  // Admin/Trabajador
  adminList(p: { page?: number; size?: number; estado?: string; }) {
    return this.http.get<any>(`${environment.apiUrl}/consultas-admin`, { params: toHttpParams(p) });
  }
  cerrar(id: number) { return this.http.post<any>(`${this.base}/${id}/cerrar`, {}); }
}
