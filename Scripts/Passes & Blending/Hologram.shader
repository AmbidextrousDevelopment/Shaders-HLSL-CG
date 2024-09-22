Shader "Donchek/Hologram" { //Basically using emission + alpha fade
    Properties {
      _RimColor ("Rim Color", Color) = (0,0.5,0.5,0.0)
      _RimPower ("Rim Power", Range(0.5,8.0)) = 3.0
    }
    SubShader {
      Tags{"Queue" = "Transparent"}
  
      Pass { //force to show Zdata, depends on model, this could be turned off
        ZWrite On
        ColorMask 0 //if you write RGB instead of 0 there, you'll see, where colormask could be
      }


      CGPROGRAM
      
      #pragma surface surf Lambert alpha:fade
      struct Input {
          float3 viewDir;
      };

      float4 _RimColor;
      float _RimPower;
      
      void surf (Input IN, inout SurfaceOutput o) {
          half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
          o.Emission = _RimColor.rgb * pow (rim, _RimPower) * 10;
          o.Alpha = pow (rim, _RimPower);
      }
      ENDCG
    } 
    Fallback "Diffuse"
  }