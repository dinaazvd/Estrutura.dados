class No {
    int valor, altura;
    No esquerda, direita;

    public No(int valor) {
        this.valor = valor;
        this.altura = 1;
    }
}

public class ArvoreAVL {
    No raiz;

    private int altura(No n) {
        return (n == null) ? 0 : n.altura;
    }

    private int getBalanceamento(No n) {
        return (n == null) ? 0 : altura(n.esquerda) - altura(n.direita);
    }

    private No rotarDireita(No y) {
        No x = y.esquerda;
        No T2 = x.direita;
        x.direita = y;
        y.esquerda = T2;
        y.altura = Math.max(altura(y.esquerda), altura(y.direita)) + 1;
        x.altura = Math.max(altura(x.esquerda), altura(x.direita)) + 1;
        return x;
    }

    private No rotarEsquerda(No x) {
        No y = x.direita;
        No T2 = y.esquerda;
        y.esquerda = x;
        x.direita = T2;
        x.altura = Math.max(altura(x.esquerda), altura(x.direita)) + 1;
        y.altura = Math.max(altura(y.esquerda), altura(y.direita)) + 1;
        return y;
    }

    public void inserir(int valor) {
        raiz = inserirRecursivo(raiz, valor);
    }

    private No inserirRecursivo(No no, int valor) {
        if (no == null) return new No(valor);

        if (valor < no.valor) {
            no.esquerda = inserirRecursivo(no.esquerda, valor);
        } else if (valor > no.valor) {
            no.direita = inserirRecursivo(no.direita, valor);
        } else {
            return no;
        }

        no.altura = 1 + Math.max(altura(no.esquerda), altura(no.direita));
        int balance = getBalanceamento(no);

        if (balance > 1 && valor < no.esquerda.valor) {
            return rotarDireita(no);
        }

        if (balance < -1 && valor > no.direita.valor) {
            return rotarEsquerda(no);
        }

        if (balance > 1 && valor > no.esquerda.valor) {
            no.esquerda = rotarEsquerda(no.esquerda);
            return rotarDireita(no);
        }

        if (balance < -1 && valor < no.direita.valor) {
            no.direita = rotarDireita(no.direita);
            return rotarEsquerda(no);
        }

        return no;
    }

    public void percursoPosOrdem(No no) {
        if (no != null) {
            percursoPosOrdem(no.esquerda);
            percursoPosOrdem(no.direita);
            System.out.print(no.valor + " ");
        }
    }

    public static void main(String[] args) {
        ArvoreAVL arvore = new ArvoreAVL();
        int[] valores = {25, 20, 27, 15, 22, 26, 30, 29, 32};
        for (int v : valores) {
            arvore.inserir(v);
        }
        arvore.percursoPosOrdem(arvore.raiz);
    }
}
