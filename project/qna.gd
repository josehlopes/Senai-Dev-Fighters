extends Node

# Dicionário de perguntas e respostas corretas
var questions_and_answers = {
	"pergunta_1": {
		"pergunta": "Encapsulamento em Java é importante na Programação Orientada a Objetos.",
		"resposta_correta": "verdadeira"
},
	"pergunta_2": {
		"pergunta": "Herança em Java é um conceito de reutilização de código.",
		"resposta_correta": "verdadeira"
},
	"pergunta_3": {
		"pergunta": "Uma classe abstrata e uma interface em Java têm diferenças em relação à implementação de métodos.",
		"resposta_correta": "verdadeira"
},
	"pergunta_4": {
		"pergunta": "Construtores em Java têm o propósito de inicializar objetos.",
		"resposta_correta": "verdadeira"
},
	"pergunta_5": {
		"pergunta": "Polimorfismo é aplicado em Java para permitir que objetos de diferentes classes sejam tratados de maneira uniforme.",
		"resposta_correta": "verdadeira"
},
	"pergunta_6": {
		"pergunta": "Classes Wrapper (Integer, Float, Double...) em Java são usadas para representar tipos primitivos como objetos.",
		"resposta_correta": "verdadeira"
},
	"pergunta_7": {
		"pergunta": "Exceções em Java são usadas para lidar com erros e situações excepcionais.",
		"resposta_correta": "verdadeira"
},
	"pergunta_8": {
		"pergunta": "Objetos não são instâncias de classes em Java.",
		"resposta_correta": "falsa"
},
	"pergunta_9": {
		"pergunta": "Classes internas (inner classes) em Java não tem muita utilidade pois não são usadas em muitos cenários, pois não oferecem benefícios em relação a classes normais.",
		"resposta_correta": "falsa"
},
	"pergunta_10": {
		"pergunta": "Um método estático (static method) em Java está estritamente associado a uma instância específica da classe e não pode ser chamado diretamente pela classe em si.",
		"resposta_correta": "falsa"
},
	"pergunta_11": {
		"pergunta": "Scrum é uma metodologia ágil e difere de outras abordagens ágeis, como o Kanban, em vários aspectos.",
		"resposta_correta": "verdadeira"
},
	"pergunta_12": {
		"pergunta": "O Manifesto Ágil tem valores, e é possível explicar cada um deles.",
		"resposta_correta": "verdadeira"
},
	"pergunta_13": {
		"pergunta": "Uma sprint em Scrum tem um propósito definido.",
		"resposta_correta": "verdadeira"
},
	"pergunta_14": {
		"pergunta": "O Scrum Master facilita o processo em um time Scrum e desempenha um papel específico.",
		"resposta_correta": "verdadeira"
},
	"pergunta_15": {
		"pergunta": "A revisão de sprint em Scrum não tem um objetivo claro.",
		"resposta_correta": "falsa"
},
	"pergunta_16": {
		"pergunta": "Na reunião de planejamento da sprint em Scrum, ocorre um processo essencial em que a equipe Scrum colaborativamente estabelece os objetivos e o escopo da próxima sprint.",
		"resposta_correta": "verdadeira"
},
	"pergunta_17": {
		"pergunta": "Lean Thinking não está relacionado às práticas ágeis.",
		"resposta_correta": "falsa"
},
	"pergunta_18": {
		"pergunta": "O DoD (Definition of Done) em Scrum não tem uma importância definida.",
		"resposta_correta": "falsa"
},
	"pergunta_19": {
		"pergunta": "Continuous Integration se encaixa nas metodologias ágeis.",
		"resposta_correta": "verdadeira"
},
	"pergunta_20": {
		"pergunta": "A retrospectiva de sprint em Scrum tem uma finalidade específica.",
		"resposta_correta": "verdadeira"
},
	"pergunta_21": {
		"pergunta": "Em Java, a herança múltipla é permitida para evitar duplicação de código.",
		"resposta_correta": "falsa"
},
	"pergunta_22": {
		"pergunta": "Em Scrum, os membros da equipe de desenvolvimento não têm influência sobre as estimativas de esforço das histórias de usuário.",
		"resposta_correta": "falsa"
},
	"pergunta_23": {
		"pergunta": "Em Java, todas as variáveis não são declaradas com um tipo específico.",
		"resposta_correta": "falsa"
},
	"pergunta_24": {
		"pergunta": "Em Scrum, o Product Owner não desempenha um papel ativo na priorização do backlog do produto.",
		"resposta_correta": "falsa"
},
	"pergunta_25": {
		"pergunta": "Em Java, métodos abstratos podem ter implementações padrão.",
		"resposta_correta": "falsa"
},
	"pergunta_26": {
		"pergunta": "No Manifesto Ágil, a ênfase é colocada na documentação detalhada e abrangente.",
		"resposta_correta": "falsa"
},
	"pergunta_27": {
		"pergunta": "Em Scrum, a retrospectiva de sprint ocorre antes da revisão de sprint.",
		"resposta_correta": "falsa"
},
	"pergunta_28": {
		"pergunta": "Em Java, métodos finais podem ser sobrescritos por subclasses.",
		"resposta_correta": "falsa"
},
	"pergunta_29": {
		"pergunta": "Em Scrum, o Scrum Master é responsável pela definição do backlog do produto.",
		"resposta_correta": "falsa"
},
	"pergunta_30": {
		"pergunta": "O SQL é uma linguagem de programação usada para gerenciar bancos de dados.",
		"resposta_correta": "falsa"
},
	"pergunta_31": {
		"pergunta": "O SQL é uma linguagem de alto nível que permite aos desenvolvedores interagir com bancos de dados de forma fácil e eficaz.",
		"resposta_correta": "verdadeira"
},
	"pergunta_32": {
		"pergunta": "No SQL, a cláusula SELECT é usada para recuperar dados de uma tabela.",
		"resposta_correta": "verdadeira"
},
	"pergunta_33": {
		"pergunta": "O SQL é uma linguagem padronizada, o que significa que as instruções SQL são as mesmas em todos os sistemas de gerenciamento de banco de dados (SGBDs).",
		"resposta_correta": "verdadeira"
},
	"pergunta_34": {
		"pergunta": "A cláusula WHERE é usada em SQL para filtrar os registros que atendem a uma condição específica.",
		"resposta_correta": "verdadeira"
},
	"pergunta_35": {
		"pergunta": "O SQL permite a criação, atualização e exclusão de registros em um banco de dados usando as instruções INSERT, UPDATE e DELETE.",
		"resposta_correta": "verdadeira"
},
	"pergunta_36": {
		"pergunta": "A cláusula VIEW é usada em SQL para combinar dados de duas ou mais tabelas relacionadas.",
		"resposta_correta": "falsa"
},
	"pergunta_37": {
		"pergunta": "A linguagem SQL não oferece suporte à criação de procedimentos armazenados, funções e gatilhos.",
		"resposta_correta": "falsa"
},
	"pergunta_38": {
		"pergunta": "A instrução SQL START TABLE é usada para criar uma nova tabela em um banco de dados.",
		"resposta_correta": "falsa"
},
	"pergunta_39": {
		"pergunta": "No SQL, a cláusula SELECT é usada para mover dados de uma tabela.",
		"resposta_correta": "falsa"
},
	"pergunta_40": {
		"pergunta": "O SQL é amplamente utilizado em sistemas de gerenciamento de banco de dados não relacionais, como MySQL, PostgreSQL e Oracle.",
		"resposta_correta": "falsa"
},
	"pergunta_41": {
		"pergunta": "Em lógica de programação, um algoritmo é uma sequência finita de instruções que descreve um processo de resolução de um problema.",
		"resposta_correta": "verdadeira"
},
	"pergunta_42": {
		"pergunta": "O termo LOOP refere-se a uma estrutura de controle que permite que um conjunto de instruções seja executado repetidamente enquanto uma condição for verdadeira.",
		"resposta_correta": "verdadeira"
},
	"pergunta_43": {
		"pergunta": "A lógica de programação é independente de linguagens de programação específicas e se aplica a qualquer linguagem.",
		"resposta_correta": "verdadeira"
},
	"pergunta_44": {
		"pergunta": "Um operador lógico AND retorna verdadeiro se um das condições envolvidas forem verdadeiras.",
		"resposta_correta": "falsa"
},
	"pergunta_45": {
		"pergunta": "Em lógica de programação, um operador de igualdade é representado por ==, e um único sinal = é usado para atribuição de valores a variáveis.",
		"resposta_correta": "verdadeira"
},
	"pergunta_46": {
		"pergunta": "A estrutura de controle SWITCH é frequentemente usada para substituir várias instruções IF quando se deseja avaliar múltiplas condições.",
		"resposta_correta": "verdadeira"
},
	"pergunta_47": {
		"pergunta": "Em lógica de programação, uma matriz (array) é uma estrutura de dados que armazena uma coleção de elementos de tipos diferentes.",
		"resposta_correta": "falsa"
},
	"pergunta_48": {
		"pergunta": "Um algoritmo eficiente é aquele que consome a maior quantidade de recursos computacionais possível para resolver um problema.",
		"resposta_correta": "falsa"
},
	"pergunta_49": {
		"pergunta": "O algorítmo conhecido com Bubble Sort é o mais conhecido e utilizado devido a sua alta capacidade de ordenar dados de maneira rápida e eficiente",
		"resposta_correta": "falsa"
},
	"pergunta_50": {
		"pergunta": "Em lógica de programação, a recursão é um conceito onde uma função chama a varias outras funções para resolver um problema, geralmente dividindo-o em subproblemas menores.",
		"resposta_correta": "falsa"
},
	"pergunta_51": {
		"pergunta": "A World Wide Web (WWW) e a internet são a mesma coisa.",
		"resposta_correta": "falsa"
},
	"pergunta_52": {
		"pergunta": "HTTPS é um protocolo de transferência de hipertexto seguro usado para criptografar a comunicação entre o navegador e o servidor web.",
		"resposta_correta": "verdadeira"
},
	"pergunta_53": {
		"pergunta": "CSS (Cascading Style Sheets) é usado para estilizar e formatar elementos HTML em uma página web.",
		"resposta_correta": "verdadeira"
},
	"pergunta_54": {
		"pergunta": "JavaScript é uma linguagem de programação frequentemente usada para adicionar interatividade e dinamismo a páginas web.",
		"resposta_correta": "verdadeira"
},
	"pergunta_55": {
		"pergunta": "Um 'COOKIE' é um pequeno arquivo de texto armazenado no navegador do usuário e frequentemente usado para rastrear informações de sessão em um site.",
		"resposta_correta": "verdadeira"
},
	"pergunta_56": {
		"pergunta": "A sigla 'URL' significa 'Uniform Resource Locator' e é usada para identificar o endereço de um recurso na web.",
		"resposta_correta": "verdadeira"
},
	"pergunta_57": {
		"pergunta": "Um servidor web é um software que fornece páginas e recursos da web para navegadores da web.",
		"resposta_correta": "verdadeira"
},
	"pergunta_58": {
		"pergunta": "SEO (Search Engine Optimization) é um conjunto de técnicas usadas para melhorar a velocidade de um site.",
		"resposta_correta": "falsa"
},
	"pergunta_59": {
		"pergunta": "O protocolo HTTPS (Hypertext Transfer Protocol) é usado para a transferência de dados na web e é baseado no modelo cliente-servidor.",
		"resposta_correta": "falsa"
},
	"pergunta_60": {
		"pergunta": "Uma API (Interface de Programação de Aplicativos) é um conjunto de regras e protocolos que impede que diferentes softwares se comuniquem e compartilhem dados ou funcionalidades.",
		"resposta_correta": "falsa"
},
	"pergunta_61": {
		"pergunta": "Uma variável é um local de armazenamento que pode conter um valor ou uma referência a um valor.",
		"resposta_correta": "verdadeira"
},
	"pergunta_62": {
		"pergunta": "O operador lógico 'OR' retorna verdadeiro se pelo menos uma das condições envolvidas for verdadeira.",
		"resposta_correta": "verdadeira"
},
	"pergunta_63": {
		"pergunta": "A declaração 'switch' é usada para avaliar múltiplas condições em uma estrutura de controle condicional.",
		"resposta_correta": "verdadeira"
},
	"pergunta_64": {
		"pergunta": "O operador 'NOT' (ou '!' em algumas linguagens) inverte o valor lógico de uma expressão, tornando verdadeiro em falso e vice-versa.",
		"resposta_correta": "verdadeira"
},
	"pergunta_65": {
		"pergunta": "A complexidade de tempo de um algoritmo descreve a quantidade de recursos de computação necessária para executá-lo.",
		"resposta_correta": "verdadeira"
},
	"pergunta_66": {
		"pergunta": "Em lógica de programação, a declaração 'while' é uma estrutura de controle usada para criar loops com um contador controlado por uma variável.",
		"resposta_correta": "falso"
},
	"pergunta_67": {
		"pergunta": "A análise de algoritmos é uma disciplina que se concentra em avaliar o desempenho e a eficiência de algoritmos em termos de tempo e espaço.",
		"resposta_correta": "verdadeira"
},
	"pergunta_68": {
		"pergunta": "Um 'loop infinito' é um tipo de loop que tem uma condição de parada clara e continua a ser executado indefinidamente.",
		"resposta_correta": "falsa"
},
	"pergunta_69": {
		"pergunta": "Em um modelo de banco de dados relacional, uma chave primaria é usada para estabelecer relacionamentos entre tabelas.",
		"resposta_correta": "falsa"
},	
	"pergunta_70": {
		"pergunta": "No modelo relacional, as visões (views) são usadas para criar representações virtuais de dados, permitindo que os usuários vejam os dados de maneira personalizada, alterando a estrutura das tabelas existentes.",
		"resposta_correta": "falsa"
},	
}
