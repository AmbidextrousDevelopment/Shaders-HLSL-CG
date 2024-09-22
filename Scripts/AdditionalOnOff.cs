using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class AdditionalOnOff : MonoBehaviour { //using with AdditionalTextureBlend Shader

    Material mat;
    bool showAdditional;

    private void OnMouseDown() //needs collider
    {
        showAdditional = !showAdditional;
        if (showAdditional)
            mat.SetFloat("_ShowAddit", 1);
        else
        {
            mat.SetFloat("_ShowAddit", 0);
        }
    }

    void Start () {
        mat = GetComponent<Renderer>().sharedMaterial;
	}
	

}
