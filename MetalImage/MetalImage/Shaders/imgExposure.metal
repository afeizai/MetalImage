//
//  imgExposure.metal
//  MetalImage
//
//  Created by xuqing on 25/7/2016.
//  Copyright © 2016 xuqing. All rights reserved.
//


#include <metal_stdlib>
using namespace metal;
kernel void exposure(
                     texture2d<float, access::read> inTexture [[texture(0)]],
                     texture2d<float, access::write> outTexture [[texture(1)]],
                     device float *exposure [[buffer(0)]],
                     uint2 gid [[thread_position_in_grid]])
{
    const float4 inColor = inTexture.read(gid);
    const float4 outColor(inColor.rgb * float3(pow(2.0, *exposure)),inColor.a);
    outTexture.write(outColor, gid);
}


