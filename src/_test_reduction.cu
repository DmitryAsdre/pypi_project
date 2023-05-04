#include <stdio.h>
#include <assert.h>
#include <iostream>
#include "_test_reduction.hh"

__global__ void calculate_sum_cu_device(double * data, size_t size, volatile double * res){
    int gid = threadIdx.x + blockDim.x*blockIdx.x;

    while(gid < size){
        atomicAdd(res, data[gid]);
        gid += blockDim.x*blockIdx.x;
    }
}

double calculate_sum_cu(double * data_host, size_t length){
    size_t size = length*sizeof(double);

    double * data_device;
    double * res_device;

    double res_host = 0;

    cudaError_t err = cudaMalloc((void**) &data_device, size);
    assert(err == 0);
    err = cudaMemcpy(data_device, data_host, size, cudaMemcpyHostToDevice);
    assert(err == 0);

    err = cudaMalloc((void**) &res_device, sizeof(double));
    assert(err == 0);
    err = cudaMemcpy(res_device, &res_host, sizeof(double), cudaMemcpyHostToDevice);
    assert(err == 0);

    calculate_sum_cu_device<<64, 64>>(data_device, length, res_device);
    err = cudaGetLastError();
    assert(err == 0);


    err = cudaMemcpy(&res_host, res_device, sizeof(double), cudaMemcpyDeviceToHost);
    assert(err == 0);

    cudaFree(res_device);
    cudaFree(data_device);

    return res_host;
}

