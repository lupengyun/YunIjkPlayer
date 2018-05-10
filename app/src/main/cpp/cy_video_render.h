#pragma once 

class ICyVideoRender {
public:
    virtual void loadI420Frame(
      int width, int height,
      const unsigned char* data_y, int stride_y,
      const unsigned char* data_u, int stride_u,
      const unsigned char* data_v, int stride_v) = 0; 
}; 

