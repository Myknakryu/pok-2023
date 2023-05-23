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