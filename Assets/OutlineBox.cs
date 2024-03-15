using UnityEngine;

public class OutlineBox : MonoBehaviour
{
    void Start()
    {
        MeshFilter meshFilter = GetComponent<MeshFilter>();
        Mesh mesh = new Mesh
        {
            name = "OutlineBox"
        };
        meshFilter.mesh = mesh;

        mesh.vertices = new Vector3[]
        {
            new Vector3(0.0f, 1.0f, 0f),
            new Vector3(1.0f, 1.0f, 0f),
            new Vector3(1.0f, 0.0f, 0f),
            new Vector3(0.0f, 0.0f, 0f),
            new Vector3(0.0f, 1.0f, 0f),
            new Vector3(1.0f, 1.0f, 0f),
            new Vector3(1.0f, 0.0f, 0f),
            new Vector3(0.0f, 0.0f, 0f)
        };

        mesh.normals = new Vector3[]
        {   
            new Vector3(-0.707f, 0.707f, 0f),
            new Vector3(0.707f, 0.707f, 0f),
            new Vector3(0.707f, -0.707f, 0f),
            new Vector3(-0.707f, -0.707f, 0f),
            new Vector3(0.707f, -0.707f, 0f),
            new Vector3(-0.707f, -0.707f, 0f),
            new Vector3(-0.707f, 0.707f, 0f),
            new Vector3(0.707f, 0.707f, 0f)
        };

        mesh.triangles = new int[]
        {
            0, 1, 5,
            0, 5, 4,
            1, 2, 6,
            1, 6, 5,
            2, 3, 7,
            2, 7, 6,
            3, 0, 4,
            3, 4, 7
        };
    }
}
