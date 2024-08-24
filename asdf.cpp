#include <iostream>
#include <cstdlib>
using namespace std;

int main()
{
    int t, row;
    cin >> t;
    cout.setf(ios::fixed);
    cout.precision(3);
    for(int i(0); i < t ; i++)
    {
        int cnt;
        cin >> row;
        double tot(0);
        int *k = new int[row];

        for(int j(0) ; j < row ; j++)
        {
            cin >> k[j];
            tot += k[j];
        }
        tot /= row;
        for(int j(0) ; j < row ; j++)
        {
            cnt = 0;
            if(k[j] > tot)
                cnt++;
        }

        cout << static_cast<double>(cnt) / row * 100<<"%";
        delete[] k;
    }

    return 0;
}