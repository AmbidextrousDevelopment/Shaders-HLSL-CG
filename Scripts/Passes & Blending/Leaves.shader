Shader "Donchek/Leaves" { //Basically example of using Alpha values
    Properties {
      _MainTex ("MainTex", 2D) = "white" {}
      
    }
    SubShader {
	
	Tags{
	"Queue" = "Transparent" //Render Queue can be changed in inspector, transparent is just best there
	}

      CGPROGRAM
      #pragma surface surf Lambert alpha:fade //makes alpha values dissapear
	  
	  sampler2D _MainTex;
	  
      struct Input {
          float2 uv_MainTex;
      };

      void surf (Input IN, inout SurfaceOutput o) {
	      fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
          o.Albedo = c.rgb;
		  o.Alpha = c.a;
      }
      ENDCG
    } 
    Fallback "Diffuse"
  }