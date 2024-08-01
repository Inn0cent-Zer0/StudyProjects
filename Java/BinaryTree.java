// Create a class for node and create variable for data
class Node {
    int Data;
    Node left, right;

    // create a constructor
    public Node(int item) {
        Data = item;
        left = right = null;
    }

}

public class BinaryTree {
    // create a  node for the root and declare all the values of the tree together
    Node root;


    public static void main(String[]args) {
        BinaryTree tree = new BinaryTree();
        tree.root = new Node(1);
        tree.root.left = new Node(2);
        tree.root.right = new Node(3);
        tree.root.left.right = new Node(4);
        tree.root.left.left = new Node(5);
        System.out.println("The leaf count of the binary tree "+tree.CountLeaves());


    }

    int CountLeaves() {
        return (CountLeaves(root));
    }

    int CountLeaves(Node node) {
        if (node == null) {
            return 0;
        }
        if (node.right == null && node.left == null) {
            return 1;
        } else {
            return CountLeaves(node.left) + CountLeaves(node.right);
        }
    }
}