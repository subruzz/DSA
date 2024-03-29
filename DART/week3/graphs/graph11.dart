class Graph {
  Map<int, Set<int>> vertices = {};

  void addEdge(int startVertex, int endVertex, bool isdoubley) {
    if (!vertices.containsKey(startVertex)) vertices[startVertex] = {};
    if (!vertices.containsKey(endVertex)) vertices[endVertex] = {};
    vertices[startVertex]!.add(endVertex);
    if (isdoubley) vertices[endVertex]!.add(startVertex);
  }

  void display() {
    for (int vertex in vertices.keys) {
      Set<int> edges = vertices[vertex]!;
      print('$vertex -> ${edges.join(', ')}');
    }
  }
}

void main() {
  Graph()
    ..addEdge(1, 3, false)
    ..addEdge(2, 5, false)
    ..addEdge(3, 2, false)
    ..addEdge(4, 1, true)
    ..addEdge(4, 2, true)
    ..display();
}


