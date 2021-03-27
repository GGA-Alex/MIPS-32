#include "Inicio.h"

Inicio::Inicio()
{

}

void Inicio::MenuPrincipal()
{
    cout << "\t----------------------------------------------------------------" << endl;
    cout << "\t|                                                              |" << endl;
    cout << "\t|                    PROYECTO FINAL MIPS                       |" << endl;
    cout << "\t|                                                              |" << endl;
    cout << "\t|                                                              |" << endl;
    cout << "\t|                    ORDENAMIENTO BURBUJA                      |" << endl;
    cout << "\t|                                                    EQUIPO #3 |" << endl;
    cout << "\t----------------------------------------------------------------" << endl;

    AdministrarArchivo administrar_archivo;
    administrar_archivo.LeerArchivo();
    administrar_archivo.CrearBR();

    cout << endl;
    cout << endl;
    cout << "\t----------------------------------------------------------------" << endl;
    cout << "\t|                                                              |" << endl;
    cout << "\t|   Archivo Instrucciones-Ordenamiento-Burbuja.mem generado    |" << endl;
    cout << "\t|                                                              |" << endl;
    cout << "\t|         Archivo BR-Ordenamiento-Burbuja.mem generado         |" << endl;
    cout << "\t|                                                              |" << endl;
    cout << "\t----------------------------------------------------------------" << endl;
    cout << "\n\n Presione cualquier tecla para salir...";
    cin.get();
}
