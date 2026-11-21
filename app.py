from flask import Flask, render_template, request

app = Flask(__name__)

# Route principale (affiche la page d'accueil avec les boutons/formulaire)
@app.route("/")
def home():
    return render_template("index.html")

# Route backend qui reçoit les données envoyées par le formulaire
@app.route("/submit", methods=["POST"])
def submit():
    # Récupère la valeur du champ 'nom' envoyé depuis le formulaire HTML
    user_input = request.form.get("nom")
    # Renvoie une page de résultat en transmettant la variable
    return render_template("resultat.html", data=user_input)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
