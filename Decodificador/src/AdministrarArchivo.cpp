#include "AdministrarArchivo.h"

AdministrarArchivo::AdministrarArchivo()
{

}

void AdministrarArchivo::LeerArchivo()
{
    string linea,linea2;
    bool inst_I = false,inst_R = false,inst_J = false,inst_B = false, inst_N = false, inst_S = false, inst_L = false;
    int cont_b = 0, cont_s = 0, cont_l = 0;
    ifstream archivo("Burbuja.asm");
    ofstream archivo2("Instrucciones-Ordenamiento-Burbuja.mem",ios::app);
    archivo >> linea;
    while(!archivo.eof()){
        if (inst_I){
            int cont = 1;
            string instruccion_completa,rs,rt,inmediato;
            stringstream ss;
            ss << linea;
            getline(ss,rt,',');
            getline(ss,rs,',');
            getline(ss,inmediato);
            instruccion_completa = "001000" + Binario5(Registros(rs)) + Binario5(Registros(rt)) + Binario16(stoi(inmediato));
            for(int i = 0; i < instruccion_completa.size(); i++){
                archivo2 << instruccion_completa[i];
                if(cont == 8){
                    archivo2 << "\n";
                    cont = 1;
                }
                else
                    cont++;
            }
        }
        if (inst_R){
            int cont = 1;
            string instruccion_completa,rs,rt,rd;
            stringstream ss;
            ss << linea;
            getline(ss,rd,',');
            getline(ss,rs,',');
            getline(ss,rt);
            instruccion_completa = "000000" + Binario5(Registros(rs)) + Binario5(Registros(rt)) + Binario5(Registros(rd)) + "00000" + "101010";
            for(int i = 0; i < instruccion_completa.size(); i++){
                archivo2 << instruccion_completa[i];
                if(cont == 8){
                    archivo2 << "\n";
                    cont = 1;
                }
                else
                    cont++;
            }
        }
        if (inst_J){
            string instruccion_completa,direccion;
            stringstream ss;
            int cont = 1;
            ss << linea;
            getline(ss,direccion);
            instruccion_completa = "000010" + Binario26(EtiquetaJ(direccion));
            for(int i = 0; i < instruccion_completa.size(); i++){
                archivo2 << instruccion_completa[i];
                if(cont == 8){
                    archivo2 << "\n";
                    cont = 1;
                }
                else
                    cont++;
            }
        }
        if (inst_B){
            string instruccion_completa,rs,rt,inmediato;
            stringstream ss;
            int cont = 1;
            ss << linea;
            getline(ss,rt,',');
            getline(ss,rs,',');
            getline(ss,inmediato);
            instruccion_completa = "000100" + Binario5(Registros(rt)) + Binario5(Registros(rs)) + EtiquetaB(cont_b);
            for(int i = 0; i < instruccion_completa.size(); i++){
                archivo2 << instruccion_completa[i];
                if(cont == 8){
                    archivo2 << "\n";
                    cont = 1;
                }
                else
                    cont++;
            }
        }
        if (inst_N){
            int cont = 1;
            string instruccion_completa;
            instruccion_completa = "00000000000000000000000000000000";
            for(int i = 0; i < instruccion_completa.size(); i++){
                archivo2 << instruccion_completa[i];
                if(cont == 8){
                    archivo2 << "\n";
                    cont = 1;
                }
                else
                    cont++;
            }
        }
        if (inst_S){
            string instruccion_completa,base,rt,offset;
            stringstream ss;
            int cont = 1;
            ss << linea;
            getline(ss,rt,',');
            getline(ss,offset,'(');
            getline(ss,base);
            instruccion_completa = "101011" + Binario5(Registros(offset)) + Binario5(Registros(rt)) + EtiquetaS(cont_s);
            for(int i = 0; i < instruccion_completa.size(); i++){
                archivo2 << instruccion_completa[i];
                if(cont == 8){
                    archivo2 << "\n";
                    cont = 1;
                }
                else
                    cont++;
            }
        }
        if (inst_L){
            string instruccion_completa,base,rt,offset;
            stringstream ss;
            int cont = 1;
            ss << linea;
            getline(ss,rt,',');
            getline(ss,offset,'(');
            getline(ss,base);
            instruccion_completa = "110001" + Binario5(Registros(offset)) + Binario5(Registros(rt)) + EtiquetaS(cont_s);
            for(int i = 0; i < instruccion_completa.size(); i++){
                archivo2 << instruccion_completa[i];
                if(cont == 8){
                    archivo2 << "\n";
                    cont = 1;
                }
                else
                    cont++;
            }
        }
        if(linea == "addi"){
            inst_I = true;
            inst_R = false;
            inst_J = false;
            inst_B = false;
            inst_N = false;
            inst_S = false;
            inst_L = false;
        }
        else if(linea == "slt"){
            inst_I = false;
            inst_R = true;
            inst_J = false;
            inst_B = false;
            inst_N = false;
            inst_S = false;
            inst_L = false;
        }
        else if (linea == "beq"){
            inst_I = false;
            inst_R = false;
            inst_J = false;
            inst_B = true;
            inst_N = false;
            inst_S = false;
            inst_L = false;
            cont_b++;
        }
        else if (linea == "j"){
            inst_I = false;
            inst_R = false;
            inst_J = true;
            inst_B = false;
            inst_N = false;
            inst_S = false;
            inst_L = false;
        }
        else if (linea == "nop"){
            inst_I = false;
            inst_R = false;
            inst_J = false;
            inst_B = false;
            inst_N = true;
            inst_S = false;
            inst_L = false;
        }
        else if (linea == "sw"){
            inst_I = false;
            inst_R = false;
            inst_J = false;
            inst_B = false;
            inst_N = false;
            inst_S = true;
            inst_L = false;
            cont_s++;
        }
        else if (linea == "lw"){
            inst_I = false;
            inst_R = false;
            inst_J = false;
            inst_B = false;
            inst_N = false;
            inst_S = true;
            inst_L = true;
            cont_l++;
        }
        else {
            inst_I = false;
            inst_R = false;
            inst_J = false;
            inst_B = false;
            inst_N = false;
            inst_S = false;
            inst_L = false;
        }
        archivo >> linea;
    }
    archivo.close();
    archivo2.close();
}

int AdministrarArchivo::Registros(string registro)
{
    if(registro == "$at")
        return 1;
    if(registro == "$v0")
        return 2;
    if(registro == "$v1")
        return 3;
    if(registro == "$a0")
        return 4;
    if (registro == "$s0")
        return 16;
    if (registro == "$s1")
        return 17;
    if (registro == "$s2")
        return 18;
    if (registro == "$s3")
        return 19;
    if (registro == "$s4")
        return 20;
    if (registro == "$s5")
        return 21;
    if (registro == "$t0")
        return 8;
    if (registro == "$t1")
        return 9;
    if (registro == "$t2")
        return 10;
    if (registro == "$t3")
        return 11;
    if (registro == "$t4")
        return 12;
    if (registro == "$t5")
        return 13;
    if (registro == "$t6")
        return 14;
    if (registro == "$t8")
        return 24;
    if (registro == "$t9")
        return 25;
    if (registro == "$zero")
        return 0;
}

string AdministrarArchivo::Binario5(int n)
{
    string binario;
    string binario_return;
    for (int i = 0; i < 5; i++) {
        if(n %2 == 0)
            binario += "0";
        else
            binario += "1";
        n /= 2;
    }
    for (int i = 4 ;i >= 0; i--)
        binario_return += binario[i];

    return binario_return;
}

string AdministrarArchivo::Binario16(int n)
{
    string binario;
    string binario_return;
    for (int i = 0; i < 16; i++) {
        if(n %2 == 0)
            binario += "0";
        else
            binario += "1";
        n /= 2;
    }
    for (int i = 15 ;i >= 0; i--)
        binario_return += binario[i];

    return binario_return;
}

string AdministrarArchivo::Binario26(int n)
{
    string binario;
    string binario_return;
    for (int i = 0; i < 26; i++) {
        if(n %2 == 0)
            binario += "0";
        else
            binario += "1";
        n /= 2;
    }
    for (int i = 25 ;i >= 0; i--)
        binario_return += binario[i];

    return binario_return;
}

string AdministrarArchivo::Binario32(int n)
{
    string binario;
    string binario_return;
    for (int i = 0; i < 32; i++) {
        if(n %2 == 0)
            binario += "0";
        else
            binario += "1";
        n /= 2;
    }
    for (int i = 31 ;i >= 0; i--)
        binario_return += binario[i];

    return binario_return;
}

int AdministrarArchivo::EtiquetaJ(string etiqueta)
{
    if (etiqueta == ".sel")
        return 42;
    if (etiqueta == ".exe")
        return 31;
    if (etiqueta == ".for2")
        return 22;
}

string AdministrarArchivo::EtiquetaB(int num)
{
    switch (num) {
    case 1:
        return "0000000001111010";
    case 2:
        return "1111111111110111";
    case 3:
        return "0000000000010010";
    case 4:
        return "0000000000100000";
    case 5:
        return "0000000000101110";
    case 6:
        return "0000000000111100";
    case 7:
        return "0000000001000110";
    case 8:
        return "0000000000110011";
    case 9:
        return "0000000000100000";
    case 10:
        return "0000000000010100";
    }
}

string AdministrarArchivo::EtiquetaS(int num)
{
    switch (num) {
    case 1:
        return "0000000000000000";
    case 2:
        return "0000000000000001";
    case 3:
        return "0000000000000010";
    case 4:
        return "0000000000000011";
    case 5:
        return "0000000000000100";

    }
}

void AdministrarArchivo::CrearBR(){
    ofstream archivo("BR-Ordenamiento-Burbuja.mem", ios::app);

    for(int i = 0; i < 32; i++)
        archivo << Binario32(0) << endl;

    archivo.close();
}
