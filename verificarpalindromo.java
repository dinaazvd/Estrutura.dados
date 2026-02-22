import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;
import java.util.Scanner;
 

public class verificarpalindromo {
    public static void main(String[]args){
        Scanner scanner = new Scanner(System.in);

        System.out.print("Escreva uma palavra ou frase: ");
        String texto_frase = scanner.nextLine();

        if (palindromo(texto_frase)){
            System.out.println("É um palíndromo!");
        }
        else {
            System.out.println("Não é um palíndromo");
        }
        scanner.close();
    }

    public static boolean palindromo(String texto) {
        String textoLimpo = texto.replaceAll("[^a-zA-Z0-9]","").toLowerCase();
        
        Stack<Character> pilha = new Stack<>();
        Queue<Character> fila = new LinkedList<>();

        for (int i = 0; i < textoLimpo.length(); i++){
           char c = textoLimpo.charAt(i);
           pilha.push(c);
           fila.add(c);
        }
    while (!pilha.isEmpty()) {
        if (!pilha.pop().equals(fila.poll())){
            return false;
        }
        
    }    
    return true;
    }
}