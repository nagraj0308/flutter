class Tree {
  String _name = 'ab';

  Tree(this._name);

  void name() {
    print('Tree: ' + _name);
  }

  void setName(String name) {
    this._name = name;
  }
}

void main() {
  final tree = Tree('NagRaj');
  tree.setName("new tree");
  tree.name();
}
