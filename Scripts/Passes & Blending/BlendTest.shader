Shader "Custom/BlendingTest" {
	Properties{
		_MainTex ("Texture", 2D) = "black" {}	
	}
	
	SubShader {
		Tags{ "Queue" = "Transparent" }
		Blend DstColor Zero
		Cull off //culling is on to inside (and backside, if one sided) by default
		Pass{ 
			 SetTexture [_MainTex] { combine texture }
		}		
	}	
}
