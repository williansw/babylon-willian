# 🧾 SW PDV 

**SW PDV** é um aplicativo Flutter robusto e modular, desenvolvido para atender estabelecimentos como restaurantes, padarias e afins. Possui uma arquitetura limpa baseada no padrão MVVM, suporte a múltiplos dispositivos, e integração com serviços essenciais como impressão, pagamento.


---
## 🎨 Guideline e Projeto no Figma

- 📐 [Acessar Guideline](https://www.figma.com/design/Twv5hhdBUgoeGNffnJTjIs/PDV-M%C3%93VEL?node-id=785-5436&p=f&t=eHRvlSKkj8qYFrg4-0)  
- 🎨 [Acessar Projeto Completo no Figma](https://www.figma.com/design/Twv5hhdBUgoeGNffnJTjIs/PDV-M%C3%93VEL?node-id=0-1&p=f&t=eHRvlSKkj8qYFrg4-0)


---

## ✨ Funcionalidades

✅ Arquitetura modular baseada em features  
✅ Padrão MVVM para escalabilidade e testabilidade  
✅ Sistema de design customizado com tema, espaçamento e tipografia  
✅ Suporte a atendimento por mesas e balcão  
✅ Fluxo completo de pedidos, transferências e cancelamentos  
✅ Catálogo de produtos com adicionais e observações  
✅ Gerenciamento dinâmico de configurações  
✅ Camada interna de serviços e modelagem de domínio  
✅ Integração de impressão e pagamento (via pacotes internos da SW)  
✅ Localização e tema centralizados

---

## 🧱 Estrutura do Projeto

```txt
lib/
├── apps/
│   ├── base/                # Inicialização, rotas e módulos do app
│   ├── common/              # Componentes, serviços e domínio compartilhado
│   ├── features/            # Funcionalidades de negócio (pedido, catálogo, etc.)
│   │   ├── order_place/     # Gestão de mesas e comanda
│   │   ├── catalog/         # Produtos, transferências, etc.
│   │   ├── payment/         # Fluxo de pagamento
│   │   └── printer/         # Integração com impressoras
├── main.dart                # Ponto de entrada do app
```

### 📁 Camada de Features (Padrão MVVM)

Cada funcionalidade segue o padrão MVVM com separação clara de responsabilidades:

```txt
└── order_place/
    ├── data/                # DTOs e repositórios
    ├── domain/              # Casos de uso e entidades
    ├── presentation/        # Telas e ViewModels
    └── service/             # Utilitários específicos do domínio
```

---

## 📦 Pacotes Internos

O projeto depende de pacotes internos da SW localizados em `../../Flutter_Packages/`, necessários para integração com os SDKs:

- `sw_packages`: Componentes e utilitários centrais
- `sw_payments`: Integração com sistema de pagamento
- `sw_printers`: Integração com impressoras

> ⚠️ Certifique-se de clonar os pacotes no caminho correto, conforme indicado no `pubspec.yaml`.

---

## 🔧 Tecnologias Utilizadas

| Ferramenta             | Finalidade                            |
|------------------------|----------------------------------------|
| Flutter                | Desenvolvimento multiplataforma        |
| Modular                | Navegação e injeção de dependências    |
| Provider               | Gerenciamento de estado                |
| Dio                    | Requisições HTTP                       |
| SignalR                | Comunicação em tempo real              |


---

## 📜 Arquitetura

O app utiliza **Clean Architecture + MVVM**, com as seguintes camadas:

- **Model** – Entidades principais e objetos de valor
- **ViewModel** – Lógica e estado, utilizando casos de uso
- **View** – Interface do usuário (UI)
- **UseCase** – Regras de negócio
- **Repository** – Abstração das fontes de dados
- **Service** – Classes auxiliares e serviços internos

---

## 🚀 Como Começar

### Pré-requisitos

- Flutter `>=3.4.0 <4.0.0`
- Dart `>=3.4.0`
- Repositórios internos no mesmo nível:

```txt
/repos/
├── Suite_POS
└── Flutter_Packages/
    ├── sw_packages
    ├── sw_payments
    └── sw_printers
```

### Instalação

```bash
git clone https://swfast.visualstudio.com/Tribe%20Master/_git/Suite_POS
cd Suite_POS
flutter pub get
flutter run
```

---

## 🌍 Localização e Design

O projeto conta com:

- Tokens de design centralizados em `common/presentation/constants`
- Gerenciamento de cores, fontes e espaçamentos
- Suporte a múltiplos idiomas
- Componentes reutilizáveis personalizados

## 📄 Licença

Este projeto é de uso interno e mantido pela **SW**. Todos os direitos reservados.