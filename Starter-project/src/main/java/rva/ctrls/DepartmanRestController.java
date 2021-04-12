package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Departman;
import rva.jpa.Fakultet;
import rva.repository.DepartmanRepository;
import rva.repository.FakultetRepository;

@CrossOrigin
@RestController
@Api(tags = {"Status CRUD operacije"})
public class DepartmanRestController {

	@Autowired
	private DepartmanRepository departmanRepository;
	
	@Autowired
	private FakultetRepository fakultetRepository;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@GetMapping("departman")
	@ApiOperation(value = "Vraca kolekciju svih departmana iz baze podataka")
	public Collection<Departman> getDepartmani() {
		return departmanRepository.findAll();
	}
	
	@GetMapping("departman/{id}")
	@ApiOperation(value = "Vraca departman u odnosu na posledjenu vrednost path varijable id")
	public Departman getDepartman(@PathVariable("id") Integer id) {
		return departmanRepository.getOne(id);
	}
	
	@GetMapping("departmanOznaka/{oznaka}")
	@ApiOperation(value = "Vraca kolekciju departmana koji imaju oznaku koji sadrzi vrednost prosledjenu u okviru path varijable oznaka")
	public Collection<Departman> getDepartmanByOznaka(@PathVariable("oznaka") String oznaka) {
		return departmanRepository.findByOznakaContainingIgnoreCase(oznaka);
	}
	
	@GetMapping("departmaniFakultet/{id}") 
	@ApiOperation(value = "Vraca kolekciju departmana koji pripadaju fakultetu cija vrednost obelezja id odgovara vrednosti path varijable id")
	public Collection<Departman> getDepartmaniByFakultet(@PathVariable("id") Integer id) {
		Fakultet f = fakultetRepository.getOne(id);
		return departmanRepository.findByFakultet(f);
	}
	
	@PostMapping("departman")
	@ApiOperation(value = "Dodaje novi departman u bazu podataka")
	public ResponseEntity<Departman> insertDepartman(@RequestBody Departman departman) {
		if(!departmanRepository.existsById(departman.getId())) {
			departmanRepository.save(departman);
			return new ResponseEntity<Departman>(HttpStatus.OK);
		}
		return new ResponseEntity<Departman>(HttpStatus.CONFLICT);
	}
	
	@PutMapping("departman")
	@ApiOperation(value = "Update-uje postojeci departman")
	public ResponseEntity<Departman> updateDepartman(@RequestBody Departman departman) {
		if(!departmanRepository.existsById(departman.getId())) {
			return new ResponseEntity<Departman>(HttpStatus.NO_CONTENT);
		}
		departmanRepository.save(departman);
		return new ResponseEntity<Departman>(HttpStatus.OK);
	}
	
	/*
	 * @Transactional
	 * 
	 * @DeleteMapping("departman/{id}") public ResponseEntity<Departman>
	 * deleteDepartman(@PathVariable("id") Integer id) {
	 * if(!departmanRepository.existsById(id)) { return new
	 * ResponseEntity<Departman>(HttpStatus.NO_CONTENT); }
	 * jdbcTemplate.execute(" DELETE FROM student WHERE departman = " + id);
	 * departmanRepository.deleteById(id); if(id == -100) { jdbcTemplate.
	 * execute(" INSERT INTO \"departman\" (\"id\", \"naziv\", \"oznaka\", \"fakultet\") "
	 * + " VALUES (-100, 'Test naziv', 'Test oznaka', 1)" ); } return new
	 * ResponseEntity<Departman>(HttpStatus.OK); }
	 */
	
	@DeleteMapping("departman/{id}")
	@ApiOperation(value = "Brise departman u odnosu na vrednost posledjene path varijable id")
	public ResponseEntity<Departman> deleteDepartman(@PathVariable("id") Integer id) {
		if (!departmanRepository.existsById(id)) {
			return new ResponseEntity<Departman>(HttpStatus.NO_CONTENT);
		}
		jdbcTemplate.execute("delete from student where departman = " + id);
		departmanRepository.deleteById(id);
		if (id == -100) {
			jdbcTemplate.execute("INSERT INTO \"departman\"(\"id\", \"naziv\", \"oznaka\", \"fakultet\") "
					+ "VALUES (-100, 'Test naziv', 'Test oznaka', 1)");
		}
		return new ResponseEntity<Departman>(HttpStatus.OK);
	}
	 
	
}
