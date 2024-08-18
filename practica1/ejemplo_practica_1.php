<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Practica 1</title>
</head>
<body>
  <form action="ejemplo_practica_1.php" method="post">
    <fieldset>
      <legend>Formulario de registro</legend>
      <div>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" placeholder="Ingresa tu nombre">
      </div>
      <div>
        <label for="nombre">Apellido</label>
        <input type="text" name="apellido" placeholder="Ingresa tu apellido">
      </div>
      <div>
        <label for="nombre">Edad</label>
        <input type="number" min="0" name="edad" placeholder="Ingresa tu edad">
      </div>
      <br>
      <div>
        <button type="submit">
          Enviar informacion
        </button>
        <a href="ejemplo_practica_1.php">Refrescar</a>
      </div>
    </fieldset>
  </form>

  <?php
    if (isset($_POST["nombre"])) {
      $nombre = $_POST["nombre"];
      $apellido = $_POST["apellido"];
      $edad = $_POST["edad"];
  
      echo "
        <p>Hola <strong>{$nombre} {$apellido}</strong> sus datos fueron registrados correctamente por POST</p>
      ";
    }
  ?>

  <p> <?= $edad ?> </p>

  <form action="ejemplo_practica_1.php" action="get" name="agregar_mes">
    <fieldset>
      <legend>Formulario de meses</legend>
      <div>
        <label for="mes">mes</label>
        <input type="number" name="mes" placeholder="Ingresa tu mes">
      </div>
      <br>
      <div>
        <button type="submit">
          Enviar informacion
        </button>
        <a href="ejemplo_practica_1.php">Refrescar</a>
      </div>
    </fieldset>
  </form>

  <?php
    $meses = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];

    if(isset($_GET['mes'])) {
      if (key_exists($_GET['mes'] - 1, $meses)) {
        echo $meses[$_GET['mes'] - 1];
      } else {
        echo 'Mes no existe o no fue agregado';
      }
    }
  ?>
</body>
</html>