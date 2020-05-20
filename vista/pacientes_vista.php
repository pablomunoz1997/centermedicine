<?php
$mensaje='';
try{
	$conexion = new PDO('mysql:host=localhost;dbname=centromedico','root','');
}catch(PDOException $e){
	echo "Error: ". $e->getMessage();
}

$consulta = $conexion -> prepare("
	SELECT * FROM pacientes");

$consulta ->execute();
$consulta = $consulta ->fetchAll();
if(!$consulta){
	$mensaje .= 'Aun no se registran Pacientes';
}
?>
<?php include 'plantillas/header.php'; ?>
	</div>
	<section class="main">
		<div class="wrapp">
			<?php include 'plantillas/nav.php'; ?>
				<article>
					<div class="mensaje">
						<h2>PACIENTES</h2>
					</div>
					<a class="agregar" href="agregarpacientes.php">Agregar Paciente</a>
					<table class="tabla">
						  <tr>
							<th>Identificacion</th>
							<th>Nombre</th>
							<th>Apellidos</th>
							<th>Direccion</th>
							<th>Telefono</th>
							<th>Fecha Nacimiento</th>
							<th>Sexo</th>
							<th colspan="2">Opciones</th>
						  </tr>
						<?php foreach ($consulta as $Sql): ?>
						<tr>
							<?php echo "<td>". $Sql['pacIdentificacion']. "</td>"; ?>
							<?php echo "<td>". $Sql['pacNombre']. "</td>"; ?>
							<?php echo "<td>". $Sql['pacApellidos']. "</td>"; ?>
							<?php echo "<td>". $Sql['pacDireccion']. "</td>"; ?>
							<?php echo "<td>". $Sql['pacTelefono']. "</td>"; ?>
							<?php echo "<td>". $Sql['pacFechaNacimiento']. "</td>"; ?>
							<?php echo "<td>". $Sql['pacSexo']. "</td>"; ?>						
                            <?php echo "<td class='centrar'>"."<a href='actualizarpaciente.php?idPaciente=".$Sql['idPaciente']."' class='editar'>Editar</a>". "</td>"; ?>
                          <?php echo "<td class='centrar'>"."<a href='eliminar_paciente.php?idPaciente=".$Sql['idPaciente']."' class='eliminar'>Eliminar</a>". "</td>"; ?>
						</tr>
						<?php endforeach; ?>
					</table>
							<?php  if(!empty($mensaje)): ?>
							  <ul>
								  <?php echo $mensaje; ?>
							  </ul>
							<?php  endif; ?>
				</article>
	</section>
<?php include 'plantillas/footer.php'; ?>
</body>
</html>