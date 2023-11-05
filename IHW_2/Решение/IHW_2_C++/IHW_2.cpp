#include <iostream>

using namespace std;
int main()
{
    float step = 0.0001;  // точность
    float result = 0;   // результат
    int l, r;   // левая и правая границы интгерирования
    float x;    // текущий x
    float a, b;     // a и b функции f(x)

    cout << "Enter lower limit of internalization (integer) L: ";
    cin >> l;
    x = l;
    cout << "Enter upper limit of internalization (integer) R: ";
    cin >> r;

    if (l > r) {
        cout << "ERROR! L > R";
        cout << '\n';
        cout << "End of the program";
        return 0;
    }

    cout << "Enter A: ";
    cin >> a;
    cout << "Enter B: ";
    cin >> b;

    while (x < r) {
        result += (a + b * x * x * x) * step;
        x += step;
    }
    cout << result;
    cout << '\n';
    cout << "End of the program";
    return 0;
}
