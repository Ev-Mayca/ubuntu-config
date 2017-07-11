/*************************************************************************
	> File Name: test.cpp
	> Author: Ev
	> Mail: wang2011yiwei@sina.com 
	> Created Time: 2017年07月11日 星期二 09时43分44秒
 ************************************************************************/
//------------------------ Include Files -------------------------------//
#include <iostream>  
#include <opencv/cv.h>  
#include <opencv/highgui.h>  
//--------------------------- Veriable ---------------------------------//
//--------------------- Function Prototype -----------------------------//
//------------------------- Function -----------------------------------//
int main()  
{  
    cv::Mat testMat = cv::Mat::zeros ( 4, 2, CV_8UC3 );  
	testMat << 1;
	//testMat = (cv::Mat_<unsigned char>(4,2) << 1,2,3,4,5,6,7,8);
    std::cout << "size of testMat: " << testMat.rows << " x " << testMat.cols << std::endl;  
	std::cout << "channel: " << testMat.channels() << std::endl;
	int n = testMat.checkVector(12,CV_8UC3);
	std::cout << "checkVector: " << n << std::endl;
    std::cout<<"testMat = "<<testMat<<std::endl;  
    cv::Mat result = testMat.reshape ( 3, 3 );  
    std::cout << " size of original testMat: " << testMat.rows << " x " << testMat.cols << std::endl;  
    std::cout << " size of reshaped testMat: " << result.rows << " x " << result.cols << std::endl;  
	std::cout << "channel: " << result.channels() << std::endl;
	n = result.checkVector(4);
	std::cout << "checkVector: " << n << std::endl;
    std::cout << "result = " << result << std::endl;  
    cv::waitKey(0);  
    //system("pause");  
    return 0;  
} 
