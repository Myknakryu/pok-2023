#include <iostream>
#include <vector>

int rank(std::vector<std::vector<double>> A){
    int rank = 0;
    std::vector<bool> rowSelected(A.size(), false);
    for (long unsigned int i = 0; i < A[0].size(); ++i) {
        long unsigned int j;
        for (j = 0; j < A.size(); ++j) {
            if (!rowSelected[j] && abs(A[j][i]) > 0.00000001)
                break;
        }

        if (j != A.size()) {
            ++rank;
            rowSelected[j] = true;
            for (long unsigned int p = i + 1; p < A[0].size(); ++p)
                A[j][p] /= A[j][i];
            for (long unsigned int k = 0; k < A.size(); ++k) {
                if (k != j && abs(A[k][i]) > 0.00000001) {
                    for (long unsigned int p = i + 1; p < A[0].size(); ++p)
                        A[k][p] -= A[j][p] * A[k][i];
                }
            }
        }
    }
    return rank;
}

std::vector<std::vector<double>> gaussJordan(std::vector<std::vector<double>> A){
    
    for(long unsigned int i = 0; i < A.size(); i++){
        for(long unsigned int j = 0; j < A.size(); j++){
            if( i!=j ){
                double ratio = A[j][i] / A[i][i];
                for(long unsigned int k = 0; k < A[0].size(); k++){
                    A[j][k] = A[j][k] - ratio * A[i][k];
                }
            }
        }
    }
    for(long unsigned int i = 0; i < A.size(); i++){
        double ratio = 1 / A[i][i];
        A[i][i] = A[i][i]*ratio;
        A[i][A[i].size()-1] = A[i][A[i].size()-1]*ratio; 
    }
    return A;
}

void printVector(std::vector<std::vector<double>> A){
    for(auto row:A){
        for(auto element:row){
            std::cout << element << ", ";
        }
        std::cout << std::endl;
    }
}

int main(){
    std::vector<std::vector <double>> matrixA = {
        {2, 1, 1, -1},
        {1, 1, -1, 1},
        {1, 1, 1, 1},
        {-1, 2, -1, 1}
    };
    std::vector<std::vector<double>> matrixB = {
        {3},
        {4},
        {10},
        {4}
    };

    if(matrixA.size() != matrixB.size()){
        std::cout << "Zły rozmiar macierzy.";
        return 1;
    }
    else{
        std::vector<std::vector<double>> matrixAB(matrixA);
        for(long unsigned int i = 0; i < matrixAB.size(); i++){
            matrixAB[i].push_back(matrixB[i][0]);
        }
        int rankA = rank(matrixA);
        int rankAB = rank(matrixAB); 
        std::cout << "rank(A) = " << rankA <<
        std::endl << "rank(AB) = "<< rankAB << std::endl;
        printVector(matrixAB);
        if(rankA == rankAB){
            std::cout << "Występuje jedno rozwiązanie" << std::endl;
        }
        else if(rankA < rankAB){
            std::cout << "Występuje więcej rozwiązań" << std::endl;
        }
        else{
            std::cout << "Brak rozwiązań problemu" << std::endl;
            return 0;
        }
        auto result = gaussJordan(matrixAB);
        printVector(result);

        for(long unsigned int i = 0; i < result.size(); i++){
            std::cout << "x" << i+1 << " = " << result[i][result[0].size()-1] << std::endl;
        }
    }
    return 0;
}