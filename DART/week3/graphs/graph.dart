class Graph {
  Map<String, Set<String>> adjList = {};

  bool addVertex(String vertex) {
    if (adjList.containsKey(vertex)) return false;
    adjList[vertex] = Set();
    return true;
  }

  bool addEdge(String vertex1, String vertex2) {
    if (adjList.containsKey(vertex1) && adjList.containsKey(vertex2)) {
      adjList[vertex1]!.add(vertex2);
      adjList[vertex2]!.add(vertex1);
      return true;
    }
    return false;
  }

  bool removeEdge(String vertex1, String vertex2) {
    if (adjList.containsKey(vertex1) && adjList.containsKey(vertex2)) {
      adjList[vertex1]!.remove(vertex2);
      adjList[vertex2]!.remove(vertex1);
      return true;
    }
    return false;
  }

  bool removeVertex(String vertex) {
    if (!adjList.containsKey(vertex)) return false;

    adjList[vertex]!.forEach((element) {
      adjList[element]!.remove(vertex);
    });
    adjList.remove(vertex);
    return true;
  }

  void printGraph() {
    adjList.forEach((key, value) {
      print('$key ->   : $value');
    });
  }
}

void main() {
  Graph graph = Graph();
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');

  print(graph.addEdge('A', 'B'));
  graph.addEdge('A', 'C');
  graph.addEdge('B', 'C');
  graph.removeVertex('C');
  // graph.removeEdge('A', 'B');
  graph.printGraph();
}
