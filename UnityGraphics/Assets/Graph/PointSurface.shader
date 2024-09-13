Shader "Graph/Point Surface"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface ConfigureSurface Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float3 worldPos;
        };

        void ConfigureSurface(Input input, inout SurfaceOutputStandard surface)
        {
            surface.Albedo.rg = input.worldPos.xy * 0.5 + 0.5;
            surface.Smoothness = 0.5;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
