Shader "Donchek/HelloShader" //to show in shader
{
	Properties
	{
		_myColour("Example Color", Color) = (1,1,1,1) //default RGB color, "Example Color" will appear in Inspector
		_myEmission("Example Emission", Color) = (1,1,1,1)
		//normal("Example normal", Color) = (1,1,1,1)
	}


	SubShader
	{
	CGPROGRAM  //Written in Language "CG"
		#pragma surface surf Lambert // #pragma - compile a surface shader, surf - void surf below, Lambert - Lighting model

		struct Input //Input data from model mesh (vertices, normals, UVs)
		{
		float2 uvMainTex; 
		};
	fixed4 _myColour, _myEmission, normal; //properties to avaible to shader function (_myColour in Properties on top)

	void surf(Input IN, inout SurfaceOutput o) { //shader function 
		o.Albedo = _myColour.rgb;
		o.Emission = _myEmission.rgb;
		//o.Normal = normal.rgb;
	}
	ENDCG

	}
	FallBack "Diffuse" //FallBack shader
}
