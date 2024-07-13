#include <iostream>
using namespace std;

int main(){
    cout << "\nLEITURA DOS ELEMENTOS DO VETOR:\n";
    int v[4];
    for(int i = 0; i < 4; i++){
        cout << "Entre com A[" << i << "]: ";
        cin >> v[i];
    }

    cout << "\nAPRESENTAÇÃO DO VETOR LIDO:\n";
    for(int i = 0; i < 4; i++){
        cout << "A[" << i << "] = " << v[i] << "\n";
    }
}