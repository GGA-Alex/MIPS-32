#ifndef ADMINISTRARARCHIVO_H
#define ADMINISTRARARCHIVO_H
#include <fstream>
#include <iostream>
#include <sstream>

using namespace std;

class AdministrarArchivo
{
public:
    AdministrarArchivo();
    void LeerArchivo();
    void CrearBR();
    int Registros(string registro);
    string Binario5(int n);
    string Binario16(int n);
    string Binario26(int n);
    string Binario32(int n);
    int EtiquetaJ(string etiqueta);
    string EtiquetaB(int num);
    string EtiquetaS(int num);
};

#endif // ADMINISTRARARCHIVO_H
